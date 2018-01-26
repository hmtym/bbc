require "csv"   # CSVライブラリの読み込み
class StaticPagesController < ApplicationController
  def top
    # CSVファイルの読み込み
    # @tweets = CSV.read('tmp/tweets.csv')
    @questions = CSV.read('tmp/question.csv')
    @tweets = Tweet.all
  end
end