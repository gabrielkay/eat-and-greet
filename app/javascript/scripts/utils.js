export const selectAll = (selector, root = document) => {
  return Array.prototype.slice.call(root.querySelectorAll(selector), 0)
}