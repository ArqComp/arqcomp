module ApplicationHelper

  def replace_css lista
    lista.collect do |e|
      e = "first-child" if e == "first"
      e = "last-child" if e == "last"
      e = "" if e == "selected"
      e
    end
  end
  
  def calendar(options = {}, &block)
    block ||= Proc.new {|d| nil}

    defaults = {
      :year => (Time.zone || Time).now.year,
      :month => (Time.zone || Time).now.month,
      :abbrev => true,
      :first_day_of_week => 0,
      :show_today => true,
      :show_header => true,
      :month_name_text => (Time.zone || Time).now.strftime("%B %Y"),
      :previous_month_text => nil,
      :next_month_text => nil,
      :event_strips => [],

      # it would be nice to have these in the CSS file
      # but they are needed to perform height calculations
      :width => nil,
      :height => 500,
      :day_names_height => 18,
      :day_nums_height => 18,
      :event_height => 18,
      :event_margin => 1,
      :event_padding_top => 2,

      :use_all_day => false,
      :use_javascript => true,
      :link_to_day_action => false
    }
    options = defaults.merge options

    # default month name for the given number
    if options[:show_header]
      options[:month_name_text] ||= I18n.translate(:'date.month_names')[options[:month]]
    end

    # make the height calculations
    # tricky since multiple events in a day could force an increase in the set height
    height = options[:day_names_height]
    row_heights = cal_row_heights(options)
    row_heights.each do |row_height|
      height += row_height
    end

    # the first and last days of this calendar month
    if options[:dates].is_a?(Range)
      first = options[:dates].begin
      last = options[:dates].end
    else
      first = Date.civil(options[:year], options[:month], 1)
      last = Date.civil(options[:year], options[:month], -1)
    end

    # create the day names array [Sunday, Monday, etc...]
    day_names = []
    if options[:abbrev]
      day_names.concat(I18n.translate(:'date.abbr_day_names'))
    else
      day_names.concat(I18n.translate(:'date.day_names'))
    end
    options[:first_day_of_week].times do
      day_names.push(day_names.shift)
    end

   
    first_day_of_week = beginning_of_week(first, options[:first_day_of_week])
    last_day_of_week = end_of_week(first, options[:first_day_of_week])
    last_day_of_cal = end_of_week(last, options[:first_day_of_week])
   
    # Build the HTML string
    cal = render :partial => "/shared/calendar_html",
      :locals => { 
      :options => options, 
      :height=> height, 
      :day_names => day_names,
      :first_day_of_week => first_day_of_week,
      :last_day_of_week => last_day_of_week,
      :last_day_of_cal => last_day_of_cal,
      :first => first,
      :last => last,
      :row_heights => row_heights,
      :block_given => block_given?,
      :block => block
    }

  end

  def cal_row_heights(options)
    # number of rows is the number of days in the event strips divided by 7
    num_cal_rows = options[:event_strips].first.size / 7
    # the row will be at least this big
    min_height = (options[:height] - options[:day_names_height]) / num_cal_rows
    row_heights = []
    num_event_rows = 0
    # for every day in the event strip...
    1.upto(options[:event_strips].first.size+1) do |index|
      num_events = 0
      # get the largest event strip that has an event on this day
      options[:event_strips].each_with_index do |strip, strip_num|
        num_events = strip_num + 1 unless strip[index-1].blank?
      end
      # get the most event rows for this week
      num_event_rows = [num_event_rows, num_events].max
      # if we reached the end of the week, calculate this row's height
      if index % 7 == 0
        total_event_height = options[:event_height] + options[:event_margin]
        calc_row_height = (num_event_rows * total_event_height) + options[:day_nums_height] + options[:event_margin]
        row_height = [min_height, calc_row_height].max
        row_heights << row_height
        num_event_rows = 0
      end
    end
    row_heights
  end
  
  def day_link(text, date, day_action)
    link_to(text, params.merge(:action => day_action, :year => date.year, :month => date.month, :day => date.day), :class => 'ec-day-link')
  end

  def no_event_bg?(event, options)
    options[:use_all_day] && !event.all_day && event.days == 0
  end

  def weekend?(date)
    [0, 6].include?(date.wday)
end
  
end
