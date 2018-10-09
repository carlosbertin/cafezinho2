module ApplicationHelper

    def number_to_currency_br(number)
        number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".")
    end

    def format_date_br(some_date)
        some_date.strftime("%d/%m/%Y")
    end
end
