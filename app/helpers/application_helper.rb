module ApplicationHelper
  
  def gravatar_for (chef, options = {size: 80}, cssclass = "")
    gravatar_id = Digest::MD5::hexdigest(chef.email.downcase)
    size = options[:size]
    custom_class = "gravatar " + cssclass
 
    
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: chef.name, class: custom_class)
  end
end
