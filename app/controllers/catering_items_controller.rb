class CateringItemsController < ApplicationController
  def CateringMenu
      @CateringMenu = CaterOrderOption.all
   end
end



