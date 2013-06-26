require 'pry'
require 'sinatra'
require 'sinatra/contrib/all'

get '/' do
  erb :home
end

get '/basic_calc' do
  @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator]

  @result = case @operator
                when "+" then @first + @second
                when "-" then @first = @second
                when "*" then @first * @second
                when "/" then @first / @second
              end

  erb :basic_calc
end

get '/bmi_calc' do
  @measurement = params[:measurement]
  @weight = params[:weight].to_f
  @height = params[:height].to_f

  @result = case @measurement
          when 'i'
           (@weight/(@height**2))*703
          when 'm'
            @weight =params[:weight].to_f
            @height = params[:height].to_f
            (@weight/(@height**2))
          else
            puts "invalid option"
        end

erb :bmi_calc
end

get '/mortgage_calc' do
  if params[:p]
  @p = params[:p].to_f
  @i = (params[:i].to_f / 12)
  @n = params[:n].to_i
  @x = (1+@i)**@n

  @result = (@p*@i*@x)/(@x-1)
  end

  erb :mortgage_calc
  end

get '/mileage_calc' do
  if params[:p]
  @distance = params[:distance].to_f || 0
  @mpg = params[:mpg].to_f || 0
  @cost = params[:cost].to_f || 0
  @speed = params[:speed].to_f || 0
  @hours = nil
  if @speed > 60
    @mpg = @mpg - ((@speed - 60) * 2)
  end

    @hours = (@distance.to_f / @speed.to_f).round(2)
  @cost_trip = ((@distance/@mpg)*@cost).round(2)
end
  erb :mileage_calc
  end




