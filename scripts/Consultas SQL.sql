--Consulta para obter os totais de área cultivada (mil ha), produtividade (kg/ha) e produção (mil ta) do cultivo de algodão, agrupados por período, região e estado.

select pro.ds_produto    produto
     , per.cd_periodo    periodo
     , reg.ds_regiao     regiao
     , est.ds_estado     estado
     , saf.vl_area       area
     , saf.vl_produt     produtividade 
     , saf.vl_produc     producao
  from t_agro_safra      saf
     , t_agro_produto    pro
     , t_agro_tp_produto tpr
     , t_cnf_estado      est
     , t_cnf_regiao      reg
     , t_cnf_pais        pai
     , t_cnf_periodo     per
     , t_agro_relatorio  rel
where saf.cd_relatorio = rel.cd_relatorio
  and saf.cd_periodo   = per.cd_periodo
  and saf.cd_produto    = pro.cd_produto
  and pro.cd_tp_produto = tpr.cd_tp_produto
  and saf.cd_estado    = est.cd_estado
  and est.cd_regiao    = reg.cd_regiao
  and reg.cd_pais      = pai.cd_pais
  and pro.cd_produto   = 1 --ALGODÃO
order by 1,2,3,4

--Consulta para obter os totais de área cultivada (milhares de hectares), produtividade (kg/ha) e produção (milhares de toneladas) do cultivo de algodão, agrupados por produto, período e estado.

select pro.ds_produto      produto
     , per.ds_periodo      periodo
     , est.ds_estado       estado
     , sum(saf.vl_area)    area
     , sum(saf.vl_produt)  produtividade 
     , sum(saf.vl_produc)  producao
  from t_agro_safra      saf
     , t_agro_produto    pro
     , t_agro_tp_produto tpr
     , t_cnf_estado      est
     , t_cnf_regiao      reg
     , t_cnf_pais        pai
     , t_cnf_periodo     per
     , t_agro_relatorio  rel
where saf.cd_relatorio = rel.cd_relatorio
  and saf.cd_periodo   = per.cd_periodo
  and saf.cd_produto    = pro.cd_produto
  and pro.cd_tp_produto = tpr.cd_tp_produto
  and saf.cd_estado    = est.cd_estado
  and est.cd_regiao    = reg.cd_regiao
  and reg.cd_pais      = pai.cd_pais
  and pro.cd_produto   = 1 --ALGODÃO
group by pro.ds_produto,per.ds_periodo,est.ds_estado
order by 1,2,3


--Ranking da produtividade da cultura do algodão por estado no período 2024-2025.
select pro.ds_produto      produto
     , per.ds_periodo      periodo
     , est.ds_estado       estado
     , sum(saf.vl_produt)  produtividade 
  from t_agro_safra      saf
     , t_agro_produto    pro
     , t_agro_tp_produto tpr
     , t_cnf_estado      est
     , t_cnf_regiao      reg
     , t_cnf_pais        pai
     , t_cnf_periodo     per
     , t_agro_relatorio  rel
where saf.cd_relatorio = rel.cd_relatorio
  and saf.cd_periodo   = per.cd_periodo
  and saf.cd_produto    = pro.cd_produto
  and pro.cd_tp_produto = tpr.cd_tp_produto
  and saf.cd_estado    = est.cd_estado
  and est.cd_regiao    = reg.cd_regiao
  and reg.cd_pais      = pai.cd_pais
  and pro.cd_produto   = 1 --ALGODÃO
  and per.cd_periodo   = 2 --PERIODO 2024-2025
group by pro.ds_produto,per.ds_periodo,est.ds_estado
order by  4 desc


--Evolução da área (mil ha) cultivada com algodão nos últimos dois períodos.
SELECT *
FROM
(
    select pro.ds_produto produto
     , per.cd_periodo     periodo
     , saf.vl_area        area
  from t_agro_safra      saf
     , t_agro_produto    pro
     , t_agro_tp_produto tpr
     , t_cnf_estado      est
     , t_cnf_regiao      reg
     , t_cnf_pais        pai
     , t_cnf_periodo     per
     , t_agro_relatorio  rel
where saf.cd_relatorio = rel.cd_relatorio
  and saf.cd_periodo   = per.cd_periodo
  and saf.cd_produto    = pro.cd_produto
  and pro.cd_tp_produto = tpr.cd_tp_produto
  and saf.cd_estado    = est.cd_estado
  and est.cd_regiao    = reg.cd_regiao
  and reg.cd_pais      = pai.cd_pais
  and pro.cd_produto   = 1 --ALGODÃO
)
PIVOT
(
    SUM(area)
   
    FOR periodo IN (1 AS PERIODO_2023_2024 , 2 AS PERIODO_2024_2025)
);
