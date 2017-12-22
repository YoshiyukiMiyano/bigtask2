class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
#    @book = Book.new
    if params[:back]
      @book = Book.new(book_params)
    else
      @book = Book.new
    end
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to books_path, notice: "つぶつぶしました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end
  
  def edit
#    @book = Book.find(params[:id])
  end
  
  def destroy
#    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice:"つぶつぶを削除しました！"
  end
  
  def update
#    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path, notice: "つぶつぶを編集しました！"
    else
      render 'edit'
    end
  end
    
  def show
    @books = Book.all
  end
  
  def confirm
    @book = Book.new(book_params)
    render :new if @book.invalid?
  end



  private
  def book_params
    params.require(:book).permit(:content)
  end
  
  def set_book
  @book = Book.find(params[:id])
  end

end
