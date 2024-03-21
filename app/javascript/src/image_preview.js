const previewImageHandler = (inputElement) => {
  const file = inputElement.files[0]
  const targets = document.querySelectorAll(inputElement.dataset.previewTarget)
  if (file) {
    /* 画像をプレビュー */
    const reader = new FileReader()
    reader.onload = () => {
      targets.forEach((elem) => {
        elem.setAttribute("src", String(reader.result))
        elem.removeAttribute("hidden")
      })
    }
    reader.readAsDataURL(file)
  } else {
    /* 画像が選択されていないので、画像を非表示 */
    targets.forEach((elem) => {
      elem.setAttribute("src", "")
      elem.setAttribute("hidden", "true")
    })
  }
}

export const imagePreview = () => {
  document.querySelectorAll('input[type="file"].js__preview-input').forEach((inputElement) => {
    inputElement.addEventListener("change", () => previewImageHandler(inputElement))
    inputElement.classList.remove("js__preview-input")
  })
}
