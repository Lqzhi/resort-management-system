export const listTransTree = (result, pidName, idName = 'id') => {
  const res = []
  const map = result.reduce((pre, item) => {
    pre[item[idName]] = item
    return pre
  }, {})
  for (const item of result) {
    if (item[pidName] === null) {
      res.push(item)
    }
    if (item[pidName] in map) {
      const parent = map[item[pidName]]
      parent.children = parent.children || []
      parent.children.push(item)
    }
  }
  return res
}
