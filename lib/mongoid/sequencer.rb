require "mongoid/sequencer/version"

module Mongoid
  module Sequencer
    extend ActiveSupport::Concern

    module ClassMethods
      def sequence(field_name)
        field_name = field_name.to_s
        field field_name, default: lambda { self.class.next_sequence_value(field_name) }
      end

      def next_sequence_value(field_name)
        collection = ::Mongoid.default_session[:__sequence]
        counter_id = "#{self.name.underscore}_#{field_name}"

        collection.find(
          _id: counter_id
        ).modify(
          {'$inc' => {value: 1}}, new: true, upsert: true
        ).fetch('value')
      end

      def reset_sequence(field_name)  
        collection = ::Mongoid.default_session[:__sequence]
        counter_id = "#{self.name.underscore}_#{field_name}"
        
        collection.find(
          _id: counter_id
        ).modify(
          {'$set' => {value: 0}}, new: true, upsert: true
        ).fetch('value')
      end
    end
  end
end
