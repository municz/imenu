#!/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'date'
require 'open-uri'
require 'pdf/reader'

class MenuRestaurant < ActiveRecord::Base
  attr_accessible :date, :menu_id, :restaurant_id
  belongs_to :menu
  belongs_to :restaurant
  
  def self.czech_to_english_date(dateString)
    dateString.to_s.gsub(/leden|únor|březen|duben|květen|červen|červenec|srpen|září|říjen|listopad|prosinec/,
      'leden' => 'Jan', 'únor' => 'Feb', 'březen' => 'Mar', 'duben' => 'Apr',
      'květen' => 'May', 'červen' => 'Jun', 'červenec' => 'Jul', 'srpen' => 'Aug', 
      'září' => 'Sep', 'říjen' => 'Oct', 'listopad' => 'Nov', 'prosinec' => 'Dec')
  end
  
  def self.fetch_academic_menu

    currentRestaurant = "ACADEMIC restaurant"
    restaurant = Restaurant.find_or_create_by_name(currentRestaurant)
#=begin
    # get pdf from url
    io     = open('http://www.skm.muni.cz/stravovani/texty/jidelnicek-ar-aktualni.cz.pdf')
    reader = PDF::Reader.new(io)

    #puts reader.page(1).text
#=end



    #reader = PDF::Reader.new("jidelnicek-ar-aktualni.cz.pdf")

    #page = reader.page(1)
    reader.pages.each do |page|

      #end if no menu on this page
      break page unless page.to_s.include? "Jídla"
     
      #get date from pdf
      dateOfPage = page.to_s.scan(/[0-9]{1,2}. [a-zčúřěáí]{4,9} [0-9]{4}/)
      currentDate = DateTime.strptime(czech_to_english_date(dateOfPage[0]), '%d. %b %Y') 
      
      #text with menus    
      textBeg = page.text.split(" 2013").last
      page = textBeg.split("Jídla ").first
        
      
      #get rid of useless parts
      page["Polévky"] = '' 
      page["Obědy"] = ''
      page["Minutky"] = ''
      page["Pizza\n"] = "\n"    

      #get rid of extra newline characters
      page.gsub!(/[0-9]\n[0-9]/, ' ')
      page.gsub!(/\n([a-zA-Zľšťžýéčúřěáí\(\)])/, '\1')
      page.gsub!(/[0-9]Pizza/, "Pizza")
      page.gsub!(/[0-9]?(\s){0,2}[0-9]{1,3}(\s)?g /,' ')


      lines = page.split("\n")
      lines.each do |line|
        part = line.split(" ", 4)
        #puts part[0].to_s + part[3].to_s
        
        menu = Menu.find_or_create_by_name_and_cenaStudent(
          part[3].to_s, (part[0]).to_i * 100)
        next if menu.id == nil 
        self.find_or_create_by_date_and_menu_id_and_restaurant_id(currentDate, menu.id, restaurant.id)
        
        #menu.restaurants << restaurant
      end
    end
  end
  
  def self.fetch_moravak_menu

    currentRestaurant = "Menza Moravské náměstí"
    restaurant = Restaurant.find_or_create_by_name(currentRestaurant)
#=begin
    # get pdf from url
    io     = open('http://www.skm.muni.cz/stravovani/texty/jidelnicek-moravske-aktualni.cz.pdf')
    reader = PDF::Reader.new(io)

    #puts reader.page(1).text
#=end



    #reader = PDF::Reader.new("jidelnicek-ar-aktualni.cz.pdf")

    #page = reader.page(1)
    reader.pages.each do |page|

      #end if no menu on this page
      break page unless page.to_s.include? "Jídla minutkového typu"
     
      #get date from pdf
      dateOfPage = page.to_s.scan(/[0-9]{1,2}. [a-zčúřěáí]{4,9} [0-9]{4}/)
      currentDate = DateTime.strptime(czech_to_english_date(dateOfPage[0]), '%d. %b %Y') 
      
      #text with menus    
      textBeg = page.text.split(" 2013").last
      page = textBeg.split("Jídla ").first
        
      
      #get rid of useless parts
      page["Polévky"] = '' 
      page["Obědy"] = ''
      page["Minutky"] = ''

      


      #get rid of extra newline characters
      page.gsub!(/[0-9]\n[0-9]/, ' ')
      page.gsub!(/\n([a-zA-Zľšťžýéčúřěáí\(\)])/, '\1')
      page.gsub!(/[0-9]?(\s){0,2}[0-9]{1,3}(\s)?g /,' ')

      lines = page.split("\n")
      lines.each do |line|
        part = line.split(" ", 4)
        #puts part[0].to_s + part[3].to_s
        
        menu = Menu.find_or_create_by_name_and_cenaStudent(
          part[3].to_s, (part[0]).to_i * 100)
        next if menu.id == nil 
        self.find_or_create_by_date_and_menu_id_and_restaurant_id(currentDate, menu.id, restaurant.id)
        
        #menu.restaurants << restaurant
      end
    end
  end
  
  def self.fetch_veveri_menu

    currentRestaurant = "Menza Veveří"
    restaurant = Restaurant.find_or_create_by_name(currentRestaurant)
#=begin
    # get pdf from url
    io     = open('http://www.skm.muni.cz/stravovani/texty/jidelnicek-veveri-aktualni.cz.pdf')
    reader = PDF::Reader.new(io)

    #puts reader.page(1).text
#=end



    #reader = PDF::Reader.new("jidelnicek-ar-aktualni.cz.pdf")

    #page = reader.page(1)
    reader.pages.each do |page|

      #end if no menu on this page
      break page unless page.to_s.include? "Jídla"
     
      #get date from pdf
      dateOfPage = page.to_s.scan(/[0-9]{1,2}. [a-zčúřěáí]{4,9} [0-9]{4}/)
      currentDate = DateTime.strptime(czech_to_english_date(dateOfPage[0]), '%d. %b %Y') 
      
      #text with menus    
      textBeg = page.text.split(" 2013").last
      page = textBeg.split("Jídla ").first
        
      
      #get rid of useless parts
      page["Polévky"] = '' 
      page["Obědy"] = ''
      page["Minutky"] = ''
      page["Večeře A\n"] = "\n"    

      #get rid of extra newline characters
      page.gsub!(/[0-9]\n[0-9]/, ' ')
      page.gsub!(/\n([a-zA-Zľšťžýéčúřěáí\(\)])/, '\1')
      page.gsub!(/[0-9]?(\s){0,2}[0-9]{1,3}(\s)?g /,' ')


      lines = page.split("\n")
      lines.each do |line|
        part = line.split(" ", 4)
        #puts part[0].to_s + part[3].to_s
        
        menu = Menu.find_or_create_by_name_and_cenaStudent(
          part[3].to_s, (part[0]).to_i * 100)
        next if menu.id == nil 
        self.find_or_create_by_date_and_menu_id_and_restaurant_id(currentDate, menu.id, restaurant.id)
        
        #menu.restaurants << restaurant
      end
    end
  end
  
  def self.fetch_vinarska_menu

    currentRestaurant = "Menza Vinařská"
    restaurant = Restaurant.find_or_create_by_name(currentRestaurant)
#=begin
    # get pdf from url
    io     = open('http://www.skm.muni.cz/stravovani/texty/jidelnicek-vinarska-aktualni.cz.pdf')
    reader = PDF::Reader.new(io)

    #puts reader.page(1).text
#=end



    #reader = PDF::Reader.new("jidelnicek-ar-aktualni.cz.pdf")

    #page = reader.page(1)
    reader.pages.each do |page|
      
      #get date from pdf
      dateOfPage = page.to_s.scan(/[0-9]{1,2}. [a-zčúřěáí]{4,9} [0-9]{4}/)
      if (dateOfPage.present?) 
        currentDate = DateTime.strptime(czech_to_english_date(dateOfPage[0]), '%d. %b %Y') 
      end
      
      #text with menus    
      textBeg = page.text.split(" 2013").last
      if (textBeg.include? "MenuČ.") then textBeg = textBeg.split("MenuČ.").last end
      page = textBeg.split("Jídla ").first
        
      
      #get rid of useless parts
      if (page.include? 'Polévky') then page["Polévky"] = '' end
      if (page.include? 'Obědy') then page["Obědy"] = '' end
      if (page.include? 'Minutky') then page["Minutky"] = '' end
      if (page.include? "Večeře A\n") then page["Večeře A\n"] = "\n"   end
      if (page.include? "Pizza\n") then page["Pizza\n"] = "\n" end
      
      
      
      #get rid of extra newline characters
      page.gsub!(/[0-9]\n[0-9]/, ' ')
      page.gsub!(/\n([a-zA-Zľšťžýéčúřěáí\(\)])/, '\1')
      page.gsub!(/[0-9]Pizza/, "Pizza")
      page.gsub!(/[0-9]?(\s){0,2}[0-9]{1,3}(\s)?g /,' ')
      


      lines = page.split("\n")
      lines.each do |line|

        part = line.split(" ", 4)
        #puts part[0].to_s + part[3].to_s
        
        next line unless part[3].to_s.length > 4
        menu = Menu.find_or_create_by_name_and_cenaStudent(
          part[3].to_s, (part[0]).to_i * 100)
        next if menu.id == nil 
        self.find_or_create_by_date_and_menu_id_and_restaurant_id(currentDate, menu.id, restaurant.id)
        
        #menu.restaurants << restaurant
      end
    end
  end
end
