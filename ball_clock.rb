class BallClock
attr_accessor :queue_tray, :minute_tray, :five_tray, :hour_tray

  def initialize
    #create empty trays
    @queue_tray   = []
    @minute_tray  = []
    @five_tray    = []
    @hour_tray    = []

    #fill up the queue tray with balls
    (1.upto(127)).each do |n|
      @queue_tray << n
    end
  end

  def method_name

  end

end
