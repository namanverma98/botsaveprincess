# frozen_string_literal: true

require 'rails_helper'

class Bot
  def princess(length, grid)
    if length%2 == 0 && length >= 3 && length < 100
   		return 'Grid size should be a odd integer and greater than 2.'
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
    p_index = grid.map { |x| x.to_s.index 'p' }
    p_row = p_index.index { |x| !x.nil? }
    p_column = p_index.select { |x| !x.nil? }.to_s.delete('[]').to_i
    m_index = grid.map { |x| x.to_s.index 'm' }
    m_row = m_index.index { |x| !x.nil? }
    m_colunn = m_index.select { |x| !x.nil? }.to_s.delete('[]').to_i
    steps = []
  while (m_colunn - p_column) > 0
  m_colunn -= 1
  steps << 'LEFT'
  end
  while (m_colunn - p_column) < 0
  m_colunn += 1
  steps << 'RIGHT'
  end
  while (m_row - p_row) < 0
  m_row += 1
  steps << 'DOWN'
  end
  while (m_row - p_row) > 0
  m_row -= 1
  steps << 'UP'
  end
    steps
  end
end

describe 'Bot' do
	it 'bot_donot_save_princess' do
		res = Bot.new.princess(2, ['---', '-m-', '--p'])
		expect(res).not_to eq(['RIGHT', 'DOWN'])
	end
	it 'bot_save_princess' do
		res = Bot.new.princess(3, ['---', '-m-', '--p'])
		expect(res).to eq(['RIGHT', 'DOWN'])
	end
	it 'bot_donot_save_princess' do
		res = Bot.new.princess(3, ['----', '-m-', '--p'])
		expect(res).not_to eq(['RIGHT', 'DOWN'])
	end
	it 'bot_save_princess' do
		res = Bot.new.princess(5, ['-----', '-----', '--m--', '-----', 'p----'])
		expect(res).to eq(['LEFT', 'LEFT', 'DOWN', 'DOWN'])
	end
	it 'bot_donot_save_princess' do
		res = Bot.new.princess(6, ['-----', '-----', '--m--', '-----', 'p----'])
		expect(res).not_to eq(['LEFT', 'LEFT', 'DOWN', 'DOWN'])
	end
	it 'bot_save_princess' do
		res = Bot.new.princess(5, ['----p', '-----', '--m--', '-----', '-----'])
		expect(res).to eq(['RIGHT', 'RIGHT', 'UP', 'UP'])
	end
end