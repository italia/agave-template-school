# Create a YAML data file to store global data about the site
create_data_file "src/_data/settings.yml", :yaml,
  # name: agave.site.global_seo.site_name,
  name: agave.site.global_seo.site_name,
  intro: ""

# Create a markdown file from the content of the `home` item type
create_post "src/index.md" do
  frontmatter :yaml, {
    #seo_meta_tags: agave.homepage.seo_meta_tags,
    title: agave.homepage.title,
    abstract: agave.homepage.abstract,
    service_title: agave.homepage.service_title,
    service_abstract: agave.homepage.service_abstract,
    school_didactic_block: agave.homepage.school_didactic_block,
    layout: 'home',
    paginate: { collection: 'news', per_page: 4 }
  }
end

# Create a markdown file from the content of the `about_page` item type
create_post "src/about.md" do
  frontmatter :yaml, {
    title: agave.identity_card_page.title,
    abstract: agave.identity_card_page.abstract,
    layout: 'about',
    #seo_meta_tags: agave.identity_card_page.seo_meta_tags
  }

  content agave.identity_card_page.body
end

# Create a markdown file from the content of the `contact_page` item type
create_post "src/contact.md" do
  frontmatter :yaml, {
    title: agave.contact_page.title,
    layout: 'contact',
    #seo_meta_tags: agave.contact_page.seo_meta_tags
  }
end

# Create a markdown file from the content of the `school_subject_page` item type
create_post "src/school_subject.md" do
  frontmatter :yaml, {
    title: agave.school_subject_page.title,
    abstract: agave.school_subject_page.abstract,
    layout: 'about',
    #seo_meta_tags: agave.school_subject_page.seo_meta_tags
  }

  content agave.school_subject_page.body
end

# Create a markdown file from the content of the `teaching_hour_page` item type
create_post "src/teaching_hour.md" do
  frontmatter :yaml, {
    title: agave.teaching_hour_page.title,
    abstract: agave.teaching_hour_page.abstract,
    layout: 'teaching_hour',
    #seo_meta_tags: agave.teaching_hour_page.seo_meta_tags
  }

  content agave.teaching_hour_page.body
end

# Create a markdown file from the content of the `oragnization_page` item type
create_post "src/oragnization.md" do
  frontmatter :yaml, {
    title: agave.oragnization_page.title,
    abstract: agave.oragnization_page.abstract,
    layout: 'oragnization',
    #seo_meta_tags: agave.oragnization_page.seo_meta_tags
  }

  content agave.oragnization_page.body
end

create_post "src/posts.md" do
  frontmatter :yaml, {
    layout: 'posts',
    paginate: {
      collection: 'posts',
      permalink: '/notizie/:num',
      per_page: 8
    }
  }
end

# Create a `_events` directory (or empty it if already exists)...
directory "src/_posts" do
  # ...and for each of the events stored online...
  agave.posts.each_with_index do |post, index|
    # ...create a markdown file with all the metadata in the frontmatter
    create_post "#{post.title.gsub(' ','_').downcase}.md" do
      frontmatter :yaml, {
        layout: 'post',
        title: post.title,
        description: post.abstract,
        position: index
      }
    end
  end
end
