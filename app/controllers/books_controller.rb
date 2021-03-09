class BooksController < ApplicationController
  def index #index.html起動時
    @book = Book.new #インスタンス変数"book"に空のモデル"Book"を生成する。

    @books = Book.all
  end

  def create
    book = Book.new(book_params)  #データを新規登録するためのインスタンス"list"作成
    if book.save #データをデータベースに保存
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)#Show画面へリダイレクト
    else
      #render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(book.id)
    else
      redirect_to edit_book_path(book),notice: "error:Input field is blank."
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
