class BusesController < ApplicationController
    before_action :find_bus_by_id, only: [:edit,:update,:destroy ]
    
    def index
        @buses = Bus.all.order("id ASC")
    end

    def new
        @bus = Bus.new
    end

    def create
        @bus = Bus.new(bus_params)
        if @bus.save
            _count = @bus.capacity 
            for char in [*'A'..'Z'] do
                Seat.create(number:char+'1',booked:false,bus:@bus)
                _count = _count - 1;
                if _count == 0
                    break
                end
                Seat.create(number:char+'2',booked:false,bus:@bus)
                _count = _count - 1;
                if _count == 0
                    break
                end
            end
            redirect_to action: 'index', status: :see_other
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @bus.update(bus_params)
            redirect_to action: 'index', status: :see_other
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @bus.destroy
        redirect_to action: 'index', status: :see_other
    end


    
    private
    
    def bus_params
        params.require(:bus).permit(:name,:typed,:brand,:capacity);
    end

    def find_bus_by_id
        @bus = Bus.find(params[:id]);
    end
end