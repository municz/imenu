#!/bin/env ruby
# encoding: utf-8

# == Schema Information
#
# Table name: menus
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  cenaStudent :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rubygems'
require 'date'
require 'open-uri'
require 'pdf/reader'


class Menu < ActiveRecord::Base
  attr_accessible :cenaStudent, :name
  has_many :menu_restaurants
  has_many :restaurants, :through => :menu_restaurants, dependent: :destroy
  
  validates :cenaStudent, presence: true
  validates_numericality_of :cenaStudent, :message => "Error: Price is not a number"
  validates :name, presence:true
  validates_uniqueness_of :name
  
end
