module ApplicationHelper
    def search
        @recensement = Recensement.all

        @q = recensements.search(params[:q])
        @people = @q.result 
    end
end
