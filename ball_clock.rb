class BallClock
attr_accessor :queue_tray, :minute_tray, :five_tray, :hour_tray

  def initialize
    #create empty trays
    @queue_tray   = []
    @minute_tray  = []
    @five_tray    = []
    @hour_tray    = []

    #fill up the queue tray with "balls," such that nubmers equal balls
    (1.upto(127)).each do |ball|
      @queue_tray << ball
    end
  end

  #the obvious methods, add_minute being the foundation
  def add_minute
    ball = grab_next_ball
    if @minute_tray < 4
      @minute_tray << ball
    else
      # dump all 4, and add one to 5 tray
    end

  end

  private #really we want all the work to be done by adding a minute ball

  def add_five

  end

  def add_hour

  end

  def refill_queue_tray

  end

  def grab_next_ball
    @queue_tray.shift
  end

end
