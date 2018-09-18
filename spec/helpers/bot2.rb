# frozen_string_literal: true

require 'rails_helper'

class Bot2
  def next_move(length, column, roo, princess)
    case
    when princess[0] - roo < 0 then move = 'UP'
    when princess[0] - roo > 0 then move = 'DOWN'
    when princess[1] - column < 0 then move = 'LEFT'
    when princess[1] - column > 0 then move = 'RIGHT'
    end
    move
  end

  def first_move(length, column, roo, grid)
    unless length >= 3 && length < 100
      return 'Grid size should be greater than 2.'
    end
    status = true
    grid.each do |g|
      if g.length != length
        status = false
      end
    end
    unless grid.length == length && status
      return 'Invalid paramters provided.'
    end
    princess = nil
    (0...length).each do |i|
      row = grid[i]
      if row.include? 'p'
        princess = [i, row.index('p')]
      end
    end
    next_move(length, column, roo, princess)
  end
end


describe 'Bot2' do
  it 'bot_donot_save_princess' do
    res = Bot2.new.first_move(2, 1, 1, ['---', '-m-', '--p'])
    expect(res).not_to eq('DOWN')
  end

  it 'bot_save_princess' do
    res = Bot2.new.first_move(3, 1, 1, ['---', '-m-', '--p'])
    expect(res).to eq('DOWN')
  end

  it 'bot_donot_save_princess' do
    res = Bot2.new.first_move(3, 1, 1, ['----', '-m-', '--p'])
    expect(res).not_to eq('DOWN')
  end

  it 'bot_save_princess' do
    res = Bot2.new.first_move(5, 4, 2, ['----p', '-----', '-----', '-----', '--m--'])
    expect(res).to eq('UP')
  end

  it 'bot_donot_save_princess' do
    res = Bot2.new.first_move(6, 4, 2, ['----p', '-----', '-----', '-----', '--m--'])
    expect(res).not_to eq('UP')
  end

end