class Dog
  MSGS = {
    :dance => 'is dancing',
    :poo => 'is a smelly doggy!',
    :laugh => 'finds this hilarious!'
  }

  def initialize(name)
    @name = name
  end

  def can(*args, &block)
    meta = class << self; self end
    meta.class_eval do
      args.each do |arg|
        define_method(arg) { "#{@name} #{MSGS[arg]}" }
      end
    end
  end

  def method_missing(sym)
    key_word = "co"
    puts "#{@name} doesn't understand #{sym}"
    if sym.match(/^#{key_word}/)
      puts "match!"
    else
      puts "not match!"
    end
  end

  def inspect
    puts self.methods
  end

end

cc=Dog.new('coffee')
p cc.can :dance,:poo,:laugh
p cc.dance
p cc.ccccssa
