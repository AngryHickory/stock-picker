def stock_picker(prices)
  max_profit = -Float::INFINITY    #=> initialize max_profit at very low number
  best_buy_day = 0    #=> initialize best_buy_day at any number, will be updated later
  best_sell_day = 1    #=> initialize best_sell_day at any number, will be updated later

  prices.each_with_index do |buy_price, buy_index|    #=> Iterate through the prices array, checking each price and its position in the array (index)
    
    remaining_prices = prices[buy_index + 1..prices.length - 1]    #=> Create a new array that starts after the vurrent buy_price and goes to the end of the prices array
    
    remaining_prices.each_with_index do |sell_price, sub_index|    #=> Iterate through the shortened array, checking each price and its position in the array (index)
      sell_index = (buy_index + 1) + sub_index    #=> This calculates the index of the price in the original prices array by starting at the index of the buy_price and adding the index of the sell_price in the shortened array

      profit = sell_price - buy_price    #=> Calculate the profit by subtracting the buy_price from the sell_price
      if profit > max_profit    #=> Check if the profit is greater than the max_profit
        max_profit = profit    #=> If it is greater, update max_profit to the new profit
        best_buy_day = buy_index    #=> Update the best_buy_day to be the index of the buy_price
        best_sell_day = sell_index    #=> Update the best_sell_day to be the index of the sell_price
      end
    end
  end
    
    return [best_buy_day, best_sell_day]    #=> Return the best_buy_day and best_sell_day as an array
end

puts stock_picker([17,3,6,9,15,8,6,1,])