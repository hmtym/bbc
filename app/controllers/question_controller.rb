require "csv"
class QuestionController < ApplicationController
    def new
        @errors =[]
    end
    
    def create
        # エラー文を格納するための配列
          @errors = []
          # 名前の空チェック
          if params[:name].empty?
            @errors << '名前が未入力です。'
          end
          # つぶやき内容の空チェック
          if params[:address].empty?
            @errors << 'メールアドレスが未入力です。'
          end
          if params[:question].empty?
            @errors << 'お問い合わせ内容が未入力です。'
          end
          # つぶやき内容の文字数チェック
          if params[:question].length > 500
            @errors << 'お問い合わせ内容は500文字以内で入力して下さい。'
          end
          # エラーがあったら新規投稿ページを表示する
          if @errors.present?
            render 'new' and return
          end
        
        csv = CSV.open('tmp/question.csv', 'a')
        time = Time.now
        csv.puts([params[:name], params[:address], params[:question], time.strftime('%Y/%m/%d %H:%M:%S')])
        csv.close
        redirect_to('/')
    end
end
