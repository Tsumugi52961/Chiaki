# frozen_string_literal: true

require 'rss'

class GetBangumis
  DMHY_URL = 'https://share.dmhy.org/'
  DMHY_RSS = 'https://share.dmhy.org/topics/rss/rss.xml'

  def self.call
    begin
      rss = RSS::Parser.parse(DMHY_RSS, false)
    rescue StandardError => e
      Rails.logger.warn("[BGM-NOTI] Bad Network: #{e.message}")
      return
    end

    new_bangumis = format_bangumis(rss.items)

    filter(new_bangumis)
  end

  private

  def self.format_bangumis(items)
    bangumis = items.map do |item|
      Bangumi.new(
        title: item.title,
        link: item.link,
        magnet_link: item.enclosure.url,
        published_at: item.pubDate.strftime('%F %T'),
        category: item.category.content
      )
    end

    Rails.logger.info("[BGM-NOTI] Fetching #{bangumis.count} bangumis.")

    bangumis
  end

  def self.filter(new_bangumis)
    stats = { success: 0, failed: 0 }
    Subscription.enabled.each do |subscription|
      cur_exp = Regexp.new(subscription['rule'])
      new_bangumis.each do |bangumi|
        bangumi.subscription = subscription
        if cur_exp.match(bangumi.title)
          if bangumi.save
            stats[:success] += 1
          else
            stats[:failed] += 1
          end
        end
      end
    end
    Rails.logger.warn("[BGM-NOTI] Complete filtering. #{stats[:success]} bangumis saved, and #{stats[:failed]} failed to save")
  end
end
