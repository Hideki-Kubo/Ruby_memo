require "csv"

puts "メモアプリを起動します"
puts "新規作成は1, 既存メモの編集は2を入力してください"
puts "1(新規でメモを作成) 2(既存のメモ編集する)"
 
memo_type = gets.to_i

if memo_type == 1 then
    puts "ファイル名を拡張子なしで入力してください"
    memo_title_new = gets.chomp.to_s #受け取った入力値の改行を削除して文字列に変換
    puts "書き込みたい内容を入力してください"
    puts "Ctrl+Dで保存します"
    memo_content_new = readlines.map(&:chomp)
    CSV.open("#{memo_title_new}.csv", "w", :encoding => "SJIS") do |csv_new|
        csv_new << [memo_content_new]
    end

elsif memo_type == 2
    puts "編集したいファイルのファイル名を拡張子なしで入力してください"
    memo_title_edit = gets.chomp.to_s
    puts "追記したい内容を入力してください"
    puts "Ctrl+Dで保存します"
    memo_content_edit = readlines.map(&:chomp)
    CSV.open("#{memo_title_edit}.csv", "a", :encoding => "SJIS") do |csv_edit|
        csv_edit << [memo_content_edit]
    end
    
else
    puts "1または2を入力してください"
    puts "このアプリを終了します"
    
end