module ScenesHelper

  def dialogue_lines(scene)
    decorated_scene(scene).dialogue_lines
  end

  def decorated_scene(scene)
    SceneDecorator.new(scene)
  end

  def line_speaker(line)
    "#{line.split(":")[0]}: "
  end

  def line_content(line)
    line.split(":")[1]
  end

  def line_class(i)
    "character-#{i.even? ? "even" : "odd"}"
  end
end
