class BooksController < ApplicationController
	def index
		@books = Book.all
		@book = Book.new
	end
	def create
	end
	def show
	end
end
