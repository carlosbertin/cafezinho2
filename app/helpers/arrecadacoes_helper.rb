module ArrecadacoesHelper

    def lista_mes_ano
        datas_mes_ano = []
        3.times do |i|
            datas_mes_ano[i] = (DateTime.current + i.month).strftime("%B/%Y")
        end
        return datas_mes_ano
    end

end
