<template>
    <div class="bg-white">
      <div class="pt-6">
        <nav aria-label="Breadcrumb">
          <ol role="list" class="mx-auto flex max-w-2xl items-center space-x-2 px-4 sm:px-6 lg:max-w-7xl lg:px-8">
            <li v-for="breadcrumb in product.breadcrumbs" :key="breadcrumb.id">
              <div class="flex items-center">
                <a :href="breadcrumb.href" class="mr-2 text-sm font-medium text-gray-900">{{ breadcrumb.name }}</a>
                <svg width="16" height="20" viewBox="0 0 16 20" fill="currentColor" aria-hidden="true" class="h-5 w-4 text-gray-300">
                  <path d="M5.697 4.34L8.98 16.532h1.327L7.025 4.341H5.697z" />
                </svg>
              </div>
            </li>
            <li class="text-sm">
              <a :href="product.href" aria-current="page" class="font-medium text-gray-500 hover:text-gray-600">{{ product.name }}</a>
            </li>
          </ol>
        </nav>

        <!-- Image gallery -->
        <div class="mx-auto mt-6 max-w-2xl sm:px-6 lg:grid lg:max-w-7xl lg:grid-cols-3 lg:gap-x-8 lg:px-8">
          <div class="aspect-h-4 aspect-w-3 hidden overflow-hidden rounded-lg lg:block">
            <img :src="product.images[0].src" :alt="product.images[0].alt" class="h-full w-full object-cover object-center" />
          </div>
          <div class="hidden lg:grid lg:grid-cols-1 lg:gap-y-8">
            <div class="aspect-h-2 aspect-w-3 overflow-hidden rounded-lg">
              <img :src="product.images[1].src" :alt="product.images[1].alt" class="h-full w-full object-cover object-center" />
            </div>
            <div class="aspect-h-2 aspect-w-3 overflow-hidden rounded-lg">
              <img :src="product.images[2].src" :alt="product.images[2].alt" class="h-full w-full object-cover object-center" />
            </div>
          </div>
          <div class="aspect-h-5 aspect-w-4 lg:aspect-h-4 lg:aspect-w-3 sm:overflow-hidden sm:rounded-lg">
            <img :src="product.images[3].src" :alt="product.images[3].alt" class="h-full w-full object-cover object-center" />
          </div>
        </div>

        <!-- Product info -->
        <div class="mx-auto max-w-2xl px-4 pb-16 pt-10 sm:px-6 lg:grid lg:max-w-7xl lg:grid-cols-3 lg:grid-rows-[auto,auto,1fr] lg:gap-x-8 lg:px-8 lg:pb-24 lg:pt-16">
          <div class="lg:col-span-2 lg:border-r lg:border-gray-200 lg:pr-8">
            <h1 class="text-2xl font-bold tracking-tight text-gray-900 sm:text-3xl">{{ product.name }}</h1>
          </div>

          <!-- Options -->
          <div class="mt-4 lg:row-span-3 lg:mt-0">
            <h2 class="sr-only">Product information</h2>
            <p class="text-3xl tracking-tight text-gray-900">{{ product.price }}</p>

            <!-- Reviews -->
            <div class="mt-6">
              <h3 class="sr-only">Reviews</h3>
              <div class="flex items-center">
                <div class="flex items-center">
                  <!-- <StarIcon v-for="rating in [0, 1, 2, 3, 4]" :key="rating" :class="[reviews.average > rating ? 'text-gray-900' : 'text-gray-200', 'h-5 w-5 flex-shrink-0']" aria-hidden="true" /> -->
                </div>
                <p class="sr-only">{{ reviews.average }} out of 5 stars</p>
                <a :href="reviews.href" class="ml-3 text-sm font-medium text-indigo-600 hover:text-indigo-500">{{ reviews.totalCount }} reviews</a>
              </div>
            </div>

            <form class="mt-10">
              <!-- Colors -->
              <div>
                <h3 class="text-sm font-medium text-gray-900">Color</h3>

                <fieldset aria-label="Choose a color" class="mt-4">
                  <!-- <RadioGroup v-model="selectedColor" class="flex items-center space-x-3">
                    <RadioGroupOption as="template" v-for="color in product.colors" :key="color.name" :value="color" :aria-label="color.name" v-slot="{ active, checked }">
                      <div :class="[color.selectedClass, active && checked ? 'ring ring-offset-1' : '', !active && checked ? 'ring-2' : '', 'relative -m-0.5 flex cursor-pointer items-center justify-center rounded-full p-0.5 focus:outline-none']">
                        <span aria-hidden="true" :class="[color.class, 'h-8 w-8 rounded-full border border-black border-opacity-10']" />
                      </div>
                    </RadioGroupOption>
                  </RadioGroup> -->
                </fieldset>
              </div>

              <!-- Sizes -->
              <div class="mt-10">
                <div class="flex items-center justify-between">
                  <h3 class="text-sm font-medium text-gray-900">Size</h3>
                  <a href="#" class="text-sm font-medium text-indigo-600 hover:text-indigo-500">Size guide</a>
                </div>

                <fieldset aria-label="Choose a size" class="mt-4">
                  <!-- <RadioGroup v-model="selectedSize" class="grid grid-cols-4 gap-4 sm:grid-cols-8 lg:grid-cols-4">
                    <RadioGroupOption as="template" v-for="size in product.sizes" :key="size.name" :value="size" :disabled="!size.inStock" v-slot="{ active, checked }">
                      <div :class="[size.inStock ? 'cursor-pointer bg-white text-gray-900 shadow-sm' : 'cursor-not-allowed bg-gray-50 text-gray-200', active ? 'ring-2 ring-indigo-500' : '', 'group relative flex items-center justify-center rounded-md border px-4 py-3 text-sm font-medium uppercase hover:bg-gray-50 focus:outline-none sm:flex-1 sm:py-6']">
                        <span>{{ size.name }}</span>
                        <span v-if="size.inStock" :class="[active ? 'border' : 'border-2', checked ? 'border-indigo-500' : 'border-transparent', 'pointer-events-none absolute -inset-px rounded-md']" aria-hidden="true" />
                        <span v-else aria-hidden="true" class="pointer-events-none absolute -inset-px rounded-md border-2 border-gray-200">
                          <svg class="absolute inset-0 h-full w-full stroke-2 text-gray-200" viewBox="0 0 100 100" preserveAspectRatio="none" stroke="currentColor">
                            <line x1="0" y1="100" x2="100" y2="0" vector-effect="non-scaling-stroke" />
                          </svg>
                        </span>
                      </div>
                    </RadioGroupOption>
                  </RadioGroup> -->
                </fieldset>
              </div>

              <button type="submit" class="mt-10 flex w-full items-center justify-center rounded-md border border-transparent bg-indigo-600 px-8 py-3 text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">Add to bag</button>
            </form>
          </div>

          <div class="py-10 lg:col-span-2 lg:col-start-1 lg:border-r lg:border-gray-200 lg:pb-16 lg:pr-8 lg:pt-6">
            <!-- Description and details -->
            <div>
              <h3 class="sr-only">Description</h3>

              <div class="space-y-6">
                <p class="text-base text-gray-900">{{ product.description }}</p>
              </div>
            </div>

            <div class="mt-10">
              <h3 class="text-sm font-medium text-gray-900">Highlights</h3>

              <div class="mt-4">
                <ul role="list" class="list-disc space-y-2 pl-4 text-sm">
                  <li v-for="highlight in product.highlights" :key="highlight" class="text-gray-400">
                    <span class="text-gray-600">{{ highlight }}</span>
                  </li>
                </ul>
              </div>
            </div>

            <div class="mt-10">
              <h2 class="text-sm font-medium text-gray-900">Details</h2>

              <div class="mt-4 space-y-6">
                <p class="text-sm text-gray-600">{{ product.details }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>

  <script setup>
  import { ref } from 'vue'
//   import { StarIcon } from '@heroicons/vue/20/solid'
//   import { RadioGroup, RadioGroupOption } from '@headlessui/vue'

  const product = {
    name: 'Basic Tee 6-Pack',
    price: '$192',
    href: '#',
    breadcrumbs: [
      { id: 1, name: 'Men', href: '#' },
      { id: 2, name: 'Clothing', href: '#' },
    ],
    images: [
      {
        src: 'https://tailwindui.com/img/ecommerce-images/product-page-02-secondary-product-shot.jpg',
        alt: 'Two each of gray, white, and black shirts laying flat.',
      },
      {
        src: 'https://tailwindui.com/img/ecommerce-images/product-page-02-tertiary-product-shot-01.jpg',
        alt: 'Model wearing plain black basic tee.',
      },
      {
        src: 'https://tailwindui.com/img/ecommerce-images/product-page-02-tertiary-product-shot-02.jpg',
        alt: 'Model wearing plain gray basic tee.',
      },
      {
        src: 'https://tailwindui.com/img/ecommerce-images/product-page-02-featured-product-shot.jpg',
        alt: 'Model wearing plain white basic tee.',
      },
    ],
    colors: [
      { name: 'White', class: 'bg-white', selectedClass: 'ring-gray-400' },
      { name: 'Gray', class: 'bg-gray-200', selectedClass: 'ring-gray-400' },
      { name: 'Black', class: 'bg-gray-900', selectedClass: 'ring-gray-900' },
    ],
    sizes: [
      { name: 'XXS', inStock: false },
      { name: 'XS', inStock: true },
      { name: 'S', inStock: true },
      { name: 'M', inStock: true },
      { name: 'L', inStock: true },
      { name: 'XL', inStock: true },
      { name: '2XL', inStock: true },
      { name: '3XL', inStock: true },
    ],
    description:
      'The Basic Tee 6-Pack allows you to fully express your vibrant personality with three grayscale options. Feeling adventurous? Put on a heather gray tee. Want to be a trendsetter? Try our exclusive colorway: "Black". Need to add an extra pop of color to your outfit? Our white tee has you covered.',
    highlights: [
      'Hand cut and sewn locally',
      'Dyed with our proprietary colors',
      'Pre-washed & pre-shrunk',
      'Ultra-soft 100% cotton',
    ],
    details:
      'The 6-Pack includes two black, two white, and two heather gray Basic Tees. Sign up for our subscription service and be the first to get new, exciting colors, like our upcoming "Charcoal Gray" limited release.',
  }
  const reviews = { href: '#', average: 4, totalCount: 117 }

  const selectedColor = ref(product.colors[0])
  const selectedSize = ref(product.sizes[2])
  </script>
