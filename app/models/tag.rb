
# See comment at bottom of Avatar.rb

class Tag

  def initialize(avatar, hash)
    @parent = avatar
    @hash = hash
  end

  def avatar
    @parent
  end

  def visible_files
    @manifest ||= JSON.parse(git.show(path, "#{number}:manifest.json"))
  end

  def output
    # Very early dojos didn't store output in initial commit
    visible_files['output'] || ''
  end

  def time
    # todo: times ?need? to come from browser and use iso8601
    Time.mktime(*hash['time'])
  end

  def light?
    colour.to_s != ''
  end

  def colour
    # Very early dojos used outcome
    (hash['colour'] || hash['outcome'] || '').to_sym
  end

  def to_json
    # Used only in differ_controller.rb
    {
      'colour' => colour,
      'time'   => time,
      'number' => number
    }
  end

  def number
    hash['number']
  end

  private

  include ExternalParentChain

  attr_reader :hash

  def path
    @parent.path
  end

end
