<template>
  <div style="height: 100%;"> <div class="container" ref="container"></div></div>
 
</template>

<script setup>
import * as THREE from 'three'
import { onMounted, ref } from 'vue';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls'
import { RGBELoader } from 'three/examples/jsm/loaders/RGBELoader'

const container = ref(null)
// 创建渲染器
const renderer = new THREE.WebGLRenderer()
renderer.setSize(window.innerWidth, window.innerHeight)
// 创建镜头
// const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000)
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000)
camera.position.z = 2
// 创建场景
const scene = new THREE.Scene()



// // 球体
const geometry = new THREE.SphereGeometry(5, 32, 32)
const loader = new RGBELoader()
loader.load('src/components/rooms/img/hdr/Living.hdr', (texture) => {
  const material = new THREE.MeshBasicMaterial({ map: texture })
  const cube = new THREE.Mesh(geometry, material)
  cube.geometry.scale(1, 1, -1)
  scene.add(cube)
})




const render = () => {
  renderer.render(scene, camera)
  requestAnimationFrame(render)
}

// vue3生命周期函数
onMounted(() => {
  const controls = new OrbitControls(camera, container.value)
  controls.enableDamping = true
  container.value.appendChild(renderer.domElement)
  render()
})
</script>

<style>

</style>