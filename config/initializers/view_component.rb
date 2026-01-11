# frozen_string_literal: true

# ViewComponent configuration
Rails.application.config.view_component.view_component_path = "app/frontend/components"

# Preview configuration (for view_component >= v4)
Rails.application.config.view_component.previews.paths << Rails.root.join("app", "frontend", "components")

# Generate template path setting
Rails.application.config.view_component.generate.sidecar = true

# Enable sidecar previews with view_component-contrib
ActiveSupport.on_load(:view_component) do
  ViewComponent::Preview.extend ViewComponentContrib::Preview::Sidecarable
end
