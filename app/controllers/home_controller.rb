class HomeController < ApplicationController
  def index
          @mangas = Manga.all
  end

  def about
  end

  def profil
  end
  
  def private
  end
end
