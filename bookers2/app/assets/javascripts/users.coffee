# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#address_zipcode").jpostal({
    postcode : [ "#address_zipcode" ],

    address  : {
      "#user_prefecture_code" : "%3", # 都道府県が入力される
      "#address_city"            : "%4%5", # 市区町村と町域が入力される
      "#address_street"          : "%6%7" # 大口事務所の番地と名称が入力される
                }
  })