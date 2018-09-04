# Create a YAML data file to store global data about the site
create_data_file "src/_data/settings.yml", :yaml,
  name: agave.navigation.site_name,
  intro: agave.homepage.abstract

create_data_file "src/_data/menu.yml", :yaml,
  [
    {
      title: agave.navigation.first_level,
      sub: agave.navigation.first_level_submenu.map do |fls|
        {
          title: fls.title,
          reference_url: (fls.reference_page) ? fls.reference_page.slug : fls.reference_url
        }
      end
    },
    {
      title: agave.navigation.second_level,
      sub: agave.navigation.second_level_submenu.map do |sls|
        {
          title: sls.title,
          reference_url: (sls.reference_page) ? sls.reference_page.slug : sls.reference_url
        }
      end
    },
    {
      title: agave.navigation.third_level,
      sub: agave.navigation.third_level_submenu.map do |tls|
        {
          title: tls.title,
          reference_url: (tls.reference_page) ? tls.reference_page.slug : tls.reference_url
        }
      end
    },
    {
      title: agave.navigation.fourth_level,
      sub: agave.navigation.fourth_level_submenu.map do |fls|
        {
          title: fls.title,
          reference_url: (fls.reference_page) ? fls.reference_page.slug : fls.reference_url
        }
      end
    }
  ]

# Create a markdown file from the content of the `home` item type
create_post "src/index.md" do
  frontmatter :yaml, {
    #seo_meta_tags: agave.homepage.seo_meta_tags,
    title: agave.homepage.title,
    abstract: agave.homepage.abstract,
    service_title: agave.homepage.service_title,
    service_abstract: agave.homepage.service_abstract,
    school_didactic_block: agave.homepage.school_didactic_block.map do |sdb|
      {
        title: sdb.title,
        abstract: sdb.abstract,
        button_label: sdb.button_label,
        button_link: sdb.button_link,
        image: sdb.image.url
      }
    end,
    layout: 'home'
  }
end

# Create a markdown file from the content of the `about_page` item type
create_post "src/#{agave.identity_card_page.slug}.md" do
  frontmatter :yaml, {
    title: agave.identity_card_page.title,
    slug: agave.identity_card_page.slug,
    abstract: agave.identity_card_page.abstract,
    cover: agave.identity_card_page.cover.url(w: 1280),
    gallery: agave.identity_card_page.gallery.map do |image|
      image.url
    end,
    document_title: agave.identity_card_page.document_title,
    document_abstract: agave.identity_card_page.document_abstract,
    document: agave.identity_card_page.document,
    layout: 'about',
    #seo_meta_tags: agave.identity_card_page.seo_meta_tags
  }

  content agave.identity_card_page.body
end

# Create a markdown file from the content of the `contact_page` item type
create_post "src/#{agave.contact_page.slug}.md" do
  frontmatter :yaml, {
    title: agave.contact_page.title,
    slug: agave.contact_page.slug,
    location: agave.contact_page.location,
    address: agave.contact_page.address,
    phone: agave.contact_page.phone,
    primary_email: agave.contact_page.primary_email,
    layout: 'contact',
    #seo_meta_tags: agave.contact_page.seo_meta_tags
  }
end

# Create a markdown file from the content of the `school_subject_page` item type
create_post "src/#{agave.school_subject_page.slug}.md" do
  frontmatter :yaml, {
    title: agave.school_subject_page.title,
    slug: agave.school_subject_page.slug,
    abstract: agave.school_subject_page.abstract,
    cover: agave.school_subject_page.cover,
    subjects: agave.school_subject_page.subjects,
    layout: 'about',
    #seo_meta_tags: agave.school_subject_page.seo_meta_tags
  }

  content agave.school_subject_page.body
end

# Create a markdown file from the content of the `teaching_hour_page` item type
create_post "src/#{agave.teaching_hour_page.slug}.md" do
  frontmatter :yaml, {
    title: agave.teaching_hour_page.title,
    slug: agave.teaching_hour_page.slug,
    abstract: agave.teaching_hour_page.abstract,
    attachment: agave.teaching_hour_page.attachment.url,
    layout: 'teaching_hour',
    #seo_meta_tags: agave.teaching_hour_page.seo_meta_tags
  }

  content agave.teaching_hour_page.body
end

# Create a markdown file from the content of the `oragnization_page` item type
create_post "src/#{agave.oragnization_page.slug}.md" do
  frontmatter :yaml, {
    title: agave.oragnization_page.title,
    slug: agave.oragnization_page.slug,
    abstract: agave.oragnization_page.abstract,
    document_title: agave.oragnization_page.document_title,
    document_abstract: agave.oragnization_page.document_abstract,
    document: agave.oragnization_page.document,
    staff: agave.oragnization_page.staff,
    layout: 'oragnization',
    #seo_meta_tags: agave.oragnization_page.seo_meta_tags
  }

  content agave.oragnization_page.body
end

#create_post "src/posts.md" do
#  frontmatter :yaml, {
#    layout: 'posts',
#    paginate: {
#      collection: 'posts',
#      permalink: '/notizie/:num',
#      per_page: 8
#    }
#  }
#end

# Create a `_posts` directory (or empty it if already exists)...
directory "src/_posts" do
  agave.posts.each_with_index do |post, index|
    # ...create a markdown file with all the metadata in the frontmatter
    create_post "#{post.slug}.md" do
      frontmatter :yaml, {
        layout: 'post',
        title: post.title,
        slug: post.slug,
        description: post.abstract,
        cover: post.cover,
        tags: post.tags,
        position: index,
        #seo_meta_tags: post.seo_meta_tags
      }

      content post.body
    end
  end
end

#create_post "src/communications.md" do
#  frontmatter :yaml, {
#    layout: 'communications',
#    paginate: {
#      collection: 'communications',
#      permalink: '/communicazioni/:num',
#      per_page: 8
#    }
#  }
#end

# Create a `_posts` directory (or empty it if already exists)...
directory "src/_communications" do
  agave.communications.each_with_index do |communication, index|
    # ...create a markdown file with all the metadata in the frontmatter
    create_post "#{communication.slug}.md" do
      frontmatter :yaml, {
        layout: 'communication',
        title: communication.title,
        slug: communication.slug,
        description: communication.abstract,
        cover: communication.cover,
        gallery: communication.gallery,
        position: index,
        #seo_meta_tags: communication.seo_meta_tags
      }

      content communication.body
    end
  end
end
