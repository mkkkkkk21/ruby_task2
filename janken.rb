$jankenResult = 0 #0:あいこ 1:勝ち 2:負け 3:終わり
$attimuteResult = "" #0:決着 1:最初から

puts "最初はグー  じゃんけん..."
puts "0:グー、1:チョキ、2:パー、3:戦わない"



def janken_play
    jankens = ["グー","チョキ","パー"]
        player1_choice = gets.to_i
        player2_choice = rand(3)

    if player1_choice > 3 
        puts "0.1.2.3のどれかを入力してください\n0:グー、1:チョキ、2:パー、3:戦わない"
        $jankenResult = 0
    
    elsif player1_choice == 3
        puts "じゃんけんを終了します"
        $jankenResult = 3
    
    else
        puts "ホイ\n--------------\nあなた:#{jankens[player1_choice]}を出しました\n相手:#{jankens[player2_choice]}を出しました\n--------------"
        if player1_choice == player2_choice
            puts "あいこで！"
            $jankenResult = 0
        elsif (player1_choice == 0 && player2_choice == 1) || (player1_choice == 1 && player2_choice == 2) || (player1_choice == 2 && player2_choice == 0)
            $jankenResult = 1
        else
            $jankenResult = 2
        end
    end
end

def attimuite_play
    puts "あっち向いて〜..."
    puts "0:上、1:下、2:右、3:左"
    attimutes = ["上","下","右","左"]
    
    player1_choice = gets.to_i
    player2_choice = rand(4)

    if player1_choice == player2_choice
        puts "ホイ\n--------------\nあなた:#{attimutes[player1_choice]}\n相手:#{attimutes[player2_choice]}\n--------------"
        if $jankenResult == 1
            puts "あなたの勝ちです！"
            $attimuteResult = 0
        elsif $jankenResult == 2
            puts "あなたの負けです..."
            $attimuteResult = 0
        end
    elsif player1_choice > 3 
        puts "不正な値です じゃんけんからやり直しです\n0:グー、1:チョキ、2:パー、3:戦わない"
        $attimuteResult = 1
    else
        puts "ホイ\n--------------\nあなた:#{attimutes[player1_choice]}\n相手:#{attimutes[player2_choice]}\n--------------"
        puts "もう一回!\nじゃんけん..."
        $attimuteResult = 1
     end
    
end



while true
    if $jankenResult == 0
        janken_play
    elsif $jankenResult == 1 || $jankenResult == 2
        attimuite_play
        if $attimuteResult == 0
            puts "また遊ぼう！"
            break
        elsif $attimuteResult == 1
            $jankenResult = 0
        end
    elsif $jankenResult == 3
        break
    end
end





