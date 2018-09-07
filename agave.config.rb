# Create a YAML data file to store global data about the site
create_data_file "src/_data/settings.yml", :yaml,
  name: (agave.navigation) ? agave.navigation.site_name : agave.homepage.title,
  intro: agave.homepage.abstract

if agave.navigation
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
end

# Create a markdown file from the content of the `home` item type
create_post "src/index.md" do
  frontmatter :yaml, {
    seo_meta_tags: agave.homepage.seo_meta_tags,
    title: agave.homepage.title,
    abstract: agave.homepage.abstract,
    service_title: agave.homepage.service_title,
    service_abstract: agave.homepage.service_abstract,
    blocks: agave.homepage.school_didactic_block.map do |sdb|
      {
        title: sdb.title,
        abstract: sdb.abstract,
        button_label: sdb.button_label,
        button_link: sdb.button_link,
        image: sdb.image.url(w: 700, h: 300, mode: "crop"),
        use_bg: sdb.use_background
      }
    end,
    layout: 'home',
    posts: agave.posts.map do |post|
      {
        title: post.title,
        abstract: post.abstract,
        cover: post.cover.url(w: 500, h: 500, mode: "crop"),
        slug: post.slug,
      }
    end,
    services: agave.service_pages.map do |service|
      {
        title: service.title,
        abstract: service.abstract,
        slug: service.slug,
      }
    end
  }
end

# Create a markdown file from the content of the `about_page` item type
create_post "src/#{agave.identity_card_page.slug}.md" do
  frontmatter :yaml, {
    title: agave.identity_card_page.title,
    slug: agave.identity_card_page.slug,
    abstract: agave.identity_card_page.abstract,
    cover: agave.identity_card_page.cover.url(w: 1280, h: 500, mode: "crop"),
    gallery: agave.identity_card_page.gallery.map do |image|
      image.url(w: 1280, h: 500, mode: "crop")
    end,
    document_title: agave.identity_card_page.document_title,
    document_abstract: agave.identity_card_page.document_abstract,
    document: agave.identity_card_page.document,
    layout: 'about',
    seo_meta_tags: agave.identity_card_page.seo_meta_tags
  }

  content agave.identity_card_page.body
end if agave.identity_card_page

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
    seo_meta_tags: agave.contact_page.seo_meta_tags
  }
end if agave.contact_page

# Create a markdown file from the content of the `school_subject_page` item type
create_post "src/#{agave.school_subject_page.slug}.md" do
  frontmatter :yaml, {
    title: agave.school_subject_page.title,
    slug: agave.school_subject_page.slug,
    abstract: agave.school_subject_page.abstract,
    cover: agave.school_subject_page.cover.url(w: 1280, h: 500, mode: "crop"),
    subjects: agave.school_subject_page.subjects,
    layout: 'school_subject',
    seo_meta_tags: agave.school_subject_page.seo_meta_tags
  }

  content agave.school_subject_page.body
end if agave.school_subject_page

# Create a markdown file from the content of the `teaching_hour_page` item type
create_post "src/#{agave.teaching_hour_page.slug}.md" do
  frontmatter :yaml, {
    title: agave.teaching_hour_page.title,
    slug: agave.teaching_hour_page.slug,
    abstract: agave.teaching_hour_page.abstract,
    attachment: agave.teaching_hour_page.attachment.url,
    layout: 'teaching_hour',
    seo_meta_tags: agave.teaching_hour_page.seo_meta_tags
  }

  content agave.teaching_hour_page.body
end if agave.teaching_hour_page

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
    seo_meta_tags: agave.oragnization_page.seo_meta_tags
  }

  content agave.oragnization_page.body
end if agave.oragnization_page

create_post "src/#{agave.posts_page.slug}.md" do
  frontmatter :yaml, {
    layout: 'posts',
    title: agave.posts_page.title,
    paginate: {
      collection: 'news',
      permalink: '/posts/:title',
      per_page: 8
    },
    posts: agave.posts.map do |post|
      {
        title: post.title,
        abstract: post.abstract,
        cover: post.cover.url(w: 1280, h: 500, mode: "crop"),
        slug: post.slug,
      }
    end
  }
end if agave.posts_page

# Create a `_posts` directory (or empty it if already exists)...
directory "src/_news" do
  agave.posts.each_with_index do |post, index|
    # ...create a markdown file with all the metadata in the frontmatter
    create_post "#{post.slug}.md" do
      frontmatter :yaml, {
        layout: 'post',
        title: post.title,
        slug: post.slug,
        description: post.abstract,
        cover: post.cover.url(w: 1280, h: 500, mode: "crop"),
        tags: post.tags.map do |t|
          {
            name: t.name
          }
        end,
        position: index,
        seo_meta_tags: post.seo_meta_tags
      }

      content post.body
    end
  end
end

create_post "src/#{agave.communications_page.slug}.md" do
  frontmatter :yaml, {
    layout: 'communications',
    title: agave.communications_page.title,
    paginate: {
      collection: 'communications',
      permalink: '/communications/:path',
      per_page: 8
    },
    communications: agave.communications.map do |communication|
      {
        title: communication.title,
        abstract: communication.abstract,
        cover: communication.cover.url(w: 1280, h: 800, mode: "crop"),
        slug: communication.slug
      }
    end
  }
end if agave.communications_page

# Create a `_communications` directory (or empty it if already exists)...
directory "src/_communications" do
  agave.communications.each_with_index do |communication, index|
    # ...create a markdown file with all the metadata in the frontmatter
    create_post "#{communication.slug}.md" do
      frontmatter :yaml, {
        layout: 'communication',
        title: communication.title,
        slug: communication.slug,
        description: communication.abstract,
        cover: communication.cover.url(w: 1280, h: 800, mode: "crop"),
        gallery: communication.gallery.map do |image|
          image.url(w: 1280, h: 800, mode: "crop")
        end,
        position: index,
        seo_meta_tags: communication.seo_meta_tags
      }

      content communication.body
    end
  end
end

# Create a `_services` directory (or empty it if already exists)...
directory "src/_services" do
  agave.service_pages.each_with_index do |service, index|
    # ...create a markdown file with all the metadata in the frontmatter
    create_post "#{service.slug}.md" do
      frontmatter :yaml, {
        layout: 'service',
        title: service.title,
        slug: service.slug,
        abstract: service.abstract,
        text_blocks: service.text_blocks.map do |block|
          {
            title: block.text_title,
            anchor: block.anchor,
            text_body: block.text_body
          }
        end,
        document_blocks: service.document_blocks.map do |block|
          {
            title: block.document_block_title,
            abstract: block.document_block_abstract,
            documents: block.documents
          }
        end,
        position: index,
        seo_meta_tags: service.seo_meta_tags
      }

      content service.body
    end
  end
end
