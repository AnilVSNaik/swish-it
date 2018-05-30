class TagsController < ApplicationController
	def add_owned_tag
	    @some_item = Item.find(params[:id])
	    owned_tag_list = @some_item.all_tags_list - @some_item.tag_list
	    owned_tag_list += [(params[:tag])]
	    @tag_owner.tag(@some_item, :with => stringify(owned_tag_list), :on => :tags)
	    @some_item.save
	end

	def stringify(tag_list)
	    tag_list.inject('') { |memo, tag| memo += (tag + ',') }[0..-1]
	end

	def remove_owned_tag
	    @some_item = Item.find(params[:id])
	    owned_tag_list = @some_item.all_tags_list - @some_item.tag_list
	    owned_tag_list -= [(params[:tag])]
	    @tag_owner.tag(@some_item, :with => stringify(owned_tag_list), :on => :tags)
	    @some_item.save
	end
end
