# -*- encoding : utf-8 -*-
module MetaHelper
  def load_meta(object)
    @keywords = object.keywords if object.respond_to?(:keywords)
    @title = object.title if object.respond_to?(:title)
    @description = object.description if object.respond_to?(:description)
  end
end
