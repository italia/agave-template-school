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
    paginate: { collection: 'posts', per_page: 4 }
  }
end

# Create a markdown file from the content of the `about_page` item type
create_post "src/about.md" do
  frontmatter :yaml, {
    title: agave.identity_card_page.title,
    slug: agave.identity_card_page.slug,
    abstract: agave.identity_card_page.abstract,
    #cover: agave.identity_card_page.cover.url,
    gallery: agave.identity_card_page.gallery,
    document_title: agave.identity_card_page.document_title,
    document_abstract: agave.identity_card_page.document_abstract,
    #document: agave.identity_card_page.document,
    layout: 'about',
    #seo_meta_tags: agave.identity_card_page.seo_meta_tags
  }

  content agave.identity_card_page.body
end

# Create a markdown file from the content of the `contact_page` item type
create_post "src/contact.md" do
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
create_post "src/school_subject.md" do
  frontmatter :yaml, {
    title: agave.school_subject_page.title,
    slug: agave.school_subject_page.slug,
    abstract: agave.school_subject_page.abstract,
    cover: agave.school_subject_page.cover,
    #subjects: agave.school_subject_page.subjects,
    layout: 'about',
    #seo_meta_tags: agave.school_subject_page.seo_meta_tags
  }

  content agave.school_subject_page.body
end

# Create a markdown file from the content of the `teaching_hour_page` item type
create_post "src/teaching_hour.md" do
  frontmatter :yaml, {
    title: agave.teaching_hour_page.title,
    slug: agave.teaching_hour_page.slug,
    abstract: agave.teaching_hour_page.abstract,
    attachment: agave.teaching_hour_page.attachment,
    layout: 'teaching_hour',
    #seo_meta_tags: agave.teaching_hour_page.seo_meta_tags
  }

  content agave.teaching_hour_page.body
end

# Create a markdown file from the content of the `oragnization_page` item type
create_post "src/oragnization.md" do
  frontmatter :yaml, {
    title: agave.oragnization_page.title,
    slug: agave.oragnization_page.slug,
    abstract: agave.oragnization_page.abstract,
    document_title: agave.oragnization_page.document_title,
    document_abstract: agave.oragnization_page.document_abstract,
    #document: agave.oragnization_page.document,
    #staff: agave.oragnization_page.staff,
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

# Create a `_posts` directory (or empty it if already exists)...
directory "src/_posts" do
  agave.posts.each_with_index do |post, index|
    # ...create a markdown file with all the metadata in the frontmatter
    create_post "#{post.title.gsub(' ','_').downcase}.md" do
      frontmatter :yaml, {
        layout: 'post',
        title: post.title,
        slug: post.slug,
        description: post.abstract,
        cover: post.cover,
        #tags: post.tags,
        position: index,
        #seo_meta_tags: post.seo_meta_tags
      }

      content post.body
    end
  end
end

create_post "src/communications.md" do
  frontmatter :yaml, {
    layout: 'communications',
    paginate: {
      collection: 'communications',
      permalink: '/communicazioni/:num',
      per_page: 8
    }
  }
end

# Create a `_posts` directory (or empty it if already exists)...
directory "src/_communications" do
  agave.communications.each_with_index do |communication, index|
    # ...create a markdown file with all the metadata in the frontmatter
    create_post "#{communication.title.gsub(' ','_').downcase}.md" do
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
