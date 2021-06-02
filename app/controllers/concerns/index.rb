module Index
  extend ActiveSupport::Concern
  
  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
  end
end