#!/bin/ruby

# Require dependencies
require '../helpers/route_spec'

# Specify data
RouteSpec.new STDOUT do
  get '/', "Home page", <<-END
    Short introduction.

    Featured events with:
    - Name
    - Type
    - Image
    - Location
    - Start time
    - End time
    - Organization
    - Tags
  END

  get '/about', "About page", <<-END
    Introduction and contact details
  END

  get '/admin', "Admin panel", <<-END
    Show links to:
    - /events/new
    - /admin/org_types
    - /admin/org_tags
    - /admin/event_types
    - /admin/event_tags
    - /admin/link_types
  END

  get '/signup', "New user form", <<-END
    User form with:
    - Display ID
    - Email
    - Password
    - Password confirmation
  END

  get '/login', "New session form", <<-END
    - Email
    - Password
  END

  get '/search', "Event and organization search", <<-END
    Search for events and organizations without filters.
  END

  get '/events', "Event list", <<-END
    Search bar.

    Filter settings:
    - Types
    - Tags
    - Organization types

    List of events with:
    - Type
    - Name
    - Location
    - Start time
    - End time
    - Organization
    - Tags
  END

  get '/events/map', "Event map", <<-END
    Filter settings:
    - Types
    - Tags
    - Organization types

    Map of events with:
    - Marker color
    - Marker image
    - Event name
    - Organization name
  END

  get '/events/calendar', "Event calendar", <<-END
    Filter settings:
    - Types
    - Tags
    - Organization types

    Events with:
    - Type
    - Name
    - Location
    - Start time
    - End time
    - Organization
  END

  get '/events/:id', "Event details", <<-END
    Event with:
    - Type
    - Name
    - Image
    - Description
    - Location
    - Start time
    - End time
    - Tags
  END

  get '/events/new', "New event form", <<-END
    Event form with:
    - Type
    - Name
    - Image
    - Description
    - Location
    - Start time
    - End time
    - Tags

    **Admins only**
  END

  get '/events/:id/edit', "Edit event form", <<-END
    Event form with:
    - Type
    - Name
    - Image
    - Description
    - Location
    - Start time
    - End time
    - Tags
  END

  get '/admin/orgs/types', "Organization type form", <<-END
    List of organization types with:
    - Name
    - Image
  END

  get '/admin/orgs/types/new', "New organization type form", <<-END
    Organization type form with:
    - Name
    - Image
  END

  get '/admin/orgs/types/:id/edit', "Edit organization type form", <<-END
    Organization type form with:
    - Name
    - Image
  END

  get '/admin/orgs/tags', "Organization tag list", <<-END
    List of organization tags with:
    - Name
    - Image
    - Color
  END

  get '/admin/orgs/tags/new', "New organization tag form", <<-END
    Organization tag form with:
    - Name
    - Image
    - Color
  END

  get '/admin/orgs/tags/:id/edit', "Edit organization tag form", <<-END
    Organization tag form with:
    - Name
    - Image
    - Color
  END

  get '/admin/events/types', "Event type form", <<-END
    List of event types with:
    - Name
    - Image
  END

  get '/admin/events/types/new', "New event type form", <<-END
    Event type form with:
    - Name
    - Image
  END

  get '/admin/events/types/:id/edit', "Edit event type form", <<-END
    Event type form with:
    - Name
    - Image
  END

  get '/admin/events/tags', "Event tag list", <<-END
    List of event tags with:
    - Name
    - Image
    - Color
  END

  get '/admin/events/tags/new', "New event tag form", <<-END
    Event tag form with:
    - Name
    - Image
    - Color
  END

  get '/admin/events/tags/:id/edit', "Edit event tag form", <<-END
    Event tag form with:
    - Name
    - Image
    - Color
  END

  get '/admin/link_types', "Link type list", <<-END
    List of link types with:
    - Name
    - Image
  END

  get '/admin/link_types/new', "New link type form", <<-END
    Link type form with:
    - Name
    - Image
  END

  get '/admin/link_types/:id/edit', "Edit link type form", <<-END
    Link type form with:
    - Name
    - Image
  END

  get '/organizations', "Organization list", <<-END
    Search bar.

    Filter settings:
    - Types
    - Tags

    List of organizations with:
    - Logo
    - Name
    - Description
    - Tags
    - Type
  END

  get '/organizations/new', "New organization form", <<-END
    Organization form with:
    - Cover
    - Logo
    - Name
    - Type
    - Descriptions
    - Video
    - Links
    - Marker color
    - Marker image
    - Tags

    **Admins only**
  END

  get '/:id', "Organization details", <<-END
    Organization with:
    - Cover
    - Logo
    - Name
    - Type
    - Descriptions
    - Video
    - Links
    - Marker color
    - Marker image
    - Tags
  END

  get '/:id/edit', "Edit organization form", <<-END
    Organization form with:
    - Cover
    - Logo
    - Name
    - Type
    - Descriptions
    - Video
    - Links
    - Marker color
    - Marker image
    - Tags

    **Admins and organizations only**
  END

  get '/:id/events', "An organizations event list", <<-END
    Search bar.

    Filter settings:
    - Types
    - Tags

    List of events with:
    - Type
    - Name
    - Location
    - Start time
    - End time
    - Organization
    - Tags
  END

  get '/:id/events/map', "An organizations event map", <<-END
    Filter settings:
    - Types
    - Tags

    Map of events with:
    - Marker color
    - Marker image
    - Event name
    - Organization name
  END

  get '/:id/events/calendar', "An organizations event calendar", <<-END
    Filter settings:
    - Types
    - Tags

    Events with:
    - Type
    - Name
    - Location
    - Start time
    - End time
  END

  get '/:id/events/new', "New event form", <<-END
    Event form with:
    - Type
    - Name
    - Image
    - Description
    - Location
    - Start time
    - End time
    - Tags

    **Admins and organizations only**
  END
end
