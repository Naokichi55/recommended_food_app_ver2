import { imagePreview } from "./image_preview"

document.addEventListener("turbo:load", imagePreview)
document.addEventListerner("turbo:render", imagePreview)
