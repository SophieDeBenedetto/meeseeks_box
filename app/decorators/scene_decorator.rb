class SceneDecorator < SimpleDelegator
  def dialogue_lines
    dialogue.split("\n")
  end
end