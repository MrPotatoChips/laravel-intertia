<template>
    <div class="min-h-screen bg-blue-50 p-5 m-0 block">
        <div class="max-w-7xl mx-auto relative">

            <div class="flex flex-wrap">
                <div class="w-full p-2 sticky top-0 z-50">
                    <div class="min-h-[75px] bg-white shadow-md rounded-md flex items-center justify-between p-4">
                        <div class="font-bold text-lg">Add a Product</div>
                        <div class="flex">
                            <div class="px-2">
                                <button class="bg-white font-bold text-gray-500 py-1 px-4">
                                    Discard
                                </button>
                            </div>
                            <div class="px-2">
                                <button class="bg-blue-500 font-bold text-white py-1 px-4 rounded-md">
                                    Save
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="shrink-0 grow-0 basis-auto w-full md:w-3/4 p-2">
                    <div class="flex flex-wrap">
                        <div v-for="(content, key) in contents" class="shrink-0 grow-0 basis-auto w-full" :key="key">
                            <div class="bg-white shadow-sm rounded-md border border-solid border-gray-100 mb-4">
                                <div class="flex flex-col">
                                    <div class="bg-gray-50 font-bold rounded-t-md p-2">
                                        Basic Informations
                                    </div>
                                    <div class="flex flex-wrap p-2">
                                        <div class="shrink-0 grow-0 basis-auto w-1/2 p-2">
                                            <div class="flex flex-wrap">
                                                <div class="shrink-0 grow-0 basis-auto w-full mb-2">
                                                    <InputLabel
                                                        for="product_name"
                                                        value="Product Name"
                                                    />
                                                </div>
                                                <div class="shrink-0 grow-0 basis-auto w-full mb-2">
                                                    <TextInput
                                                        id="product_name"
                                                        class="w-full"
                                                        placeholder="enter here"
                                                    />
                                                </div>
                                                <div class="">
                                                    <InputError
                                                        message=""
                                                    />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="shrink-0 grow-0 basis-auto w-full md:w-1/4 p-2">
                    <div class="flex flex-wrap sticky top-[100px] z-10">
                        <div class="shrink-0 grow-0 basis-auto w-full">
                            <div class="bg-white shadow-sm rounded-md border border-solid border-gray-100 mb-4">
                                <div class="flex flex-col">
                                    <div class="bg-gray-50 font-bold rounded-t-md p-2">
                                        Type
                                    </div>
                                    <div class="flex flex-wrap p-2">
                                        <div class="shrink-0 grow-0 basis-auto w-full p-2">
                                            <div class="flex flex-wrap">
                                                <div class="shrink-0 grow-0 basis-auto w-full mb-2">
                                                    <InputLabel
                                                        for="product_name"
                                                        value="Product Name"
                                                    />
                                                </div>
                                                <div class="shrink-0 grow-0 basis-auto w-full mb-2">
                                                    <TextInput
                                                        id="product_name"
                                                        class="w-full"
                                                        placeholder="enter here"
                                                    />
                                                </div>
                                                <div class="">
                                                    <InputError
                                                        message=""
                                                    />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="shrink-0 grow-0 basis-auto w-full p-2">
                                            <div class="flex flex-wrap">
                                                <div class="shrink-0 grow-0 basis-auto w-full mb-2">
                                                    <InputLabel
                                                        for="product_name"
                                                        value="Product Name"
                                                    />
                                                </div>
                                                <div class="shrink-0 grow-0 basis-auto w-full mb-2">
                                                    <select class="w-full border-gray-300 text-gray-600 focus:border-blue-500 focus:ring-blue-500 rounded-md shadow-sm">
                                                        <option>select here</option>
                                                        <option>select 2</option>
                                                    </select>
                                                </div>
                                                <div class="">
                                                    <InputError
                                                        message=""
                                                    />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {{ JSON.stringify(contents) }}
            </div>
    </div>
</template>
<script setup>
    import InputError from '@/Components/InputError.vue';
    import InputLabel from '@/Components/InputLabel.vue';
    import TextInput from '@/Components/TextInput.vue';

    defineProps({
        product: {
            type: Object,
            default: () => {},
            required: true
        }
    })

    const contents = Array.from({ length: 10 }).map((_, key) => ({
        name: `Name ${key}`
    }))
</script>
