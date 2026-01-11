// Vite + Rails Application Entrypoint
import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"

// Import stylesheets
import "../stylesheets/application.css"

// Start Stimulus
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { registerControllers } from "stimulus-vite-helpers"
const controllers = import.meta.glob("../controllers/**/*_controller.js", { eager: true })
registerControllers(application, controllers)

// Example: Import component controllers from app/frontend/components
// const componentControllers = import.meta.glob("../components/**/*_controller.js", { eager: true })
// registerControllers(application, componentControllers)

console.log("Vite + Rails ready")
