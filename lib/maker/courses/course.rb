require 'yaml'
require 'pathname'
require 'active_attr'

module Maker
  module Courses
    class Course

      include ActiveAttr::Model

      attribute :id
      attribute :name
      attribute :repo
      attribute :activities, default: []
      attribute :projects, default: []

      def self.registry_folder
        File.join(File.dirname(__FILE__), "registry")
      end

      def self.load(course_id)
        attributes = YAML.load_file(File.join(registry_folder, "#{course_id}.yml"))

        new(id: course_id).tap do |course|

          %W[activities projects].each do |pod_type|
            pods = (attributes.delete(pod_type) || []).map do |id, pod_attributes|
              Pod.new(pod_attributes.merge(id: id))
            end
            course.send("#{pod_type}=", pods)
          end

          course.assign_attributes(attributes)
        end
      end

      def self.all
        Dir["#{registry_folder}/*"].map do |course_config_path|
          course_id = File.basename(course_config_path, ".yml")
          load(course_id)
        end
      end

      def self.find(id)
        all.find do |course|
          course.id == id
        end
      end

      def find_activity(activity_id)
        activities.detect do |activity|
          activity.id == activity_id
        end
      end
    end
  end
end
