# frozen_string_literal: true

module Components
  class Calendar < Components::BaseComponent
    def update
      clear_list
      update_list
    end

    private

    def clear_list
      list_items.each(&method(:remove))
    end

    def remove(item)
      # you can't remove items from @list_items because the fire will spread
      item.send opts[:play_with_fire] ? :remove_and_free_text : :remove
    end

    def list_items
      @list_items ||= []
    end

    def update_list
      y_offset = opts[:y_offset] || 0
      event_groups.flatten.each do |event|
        case event
        when String
          list_items << Text.new(event,
                                 size: 4.vh,
                                 color: 'white',
                                 x: opts[:x],
                                 y: opts[:y] + y_offset + 1.vh)
          y_offset += 8.vh
        when Object
          list_items << Text.new(event_text(event),
                                 size: 3.vh,
                                 color: 'white',
                                 x: opts[:x],
                                 y: opts[:y] + y_offset)
          y_offset += 6.vh
        end
      end
    end

    def event_groups
      Components::Calendars::Parse.get_upcomming_events_for(opts[:calendar_id])
    end

    def event_text(event)
      event.start.date_time.strftime('%H:%M | ') +
        event.summary
    end
  end
end
