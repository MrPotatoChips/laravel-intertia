<template>
    <div class="h-screen flex justify-center items-center">
        <div class="flex flex-wrap p-4 w-1/3">
            <div class="shrink-0 grow-0 basis-auto w-full p-2">
                <div class="flex flex-wrap">
                    <div class="shrink-0 grow-0 basis-auto w-full mb-2">
                        <InputLabel
                            for="search"
                            value="Search"
                        />
                    </div>
                    <div class="shrink-0 grow-0 basis-auto w-full mb-2">
                        <TextInput
                            id="search"
                            class="w-full"
                            placeholder="search here"
                        />
                    </div>
                </div>
            </div>
            <div class="shrink-0 grow-0 basis-auto w-full p-2">
                <table class="w-full">
                    <thead class="bg-gray-100">
                        <tr>
                            <th class="p-1.5 w-[25px] text-center">#</th>
                            <th class="p-1.5 w-[75px] text-center">Action</th>
                            <th class="p-1.5 text-left">Product Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr
                            v-for="(row, key) in products.data">
                            <td class="p-1.5 text-center">{{ products.per_page + products.current_page + key + 1 }}</td>
                            <td class="p-1.5 text-center">
                                <Link
                                    :href="route('products.show', row.id)"
                                    class="rounded-full px-3 py-0.5 bg-gray-200"
                                >
                                    Edit
                                </Link>
                            </td>
                            <td class="p-1.5 text-left">{{ row.product_name }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="shrink-0 grow-0 basis-auto w-full p-2">
                <div class="flex flex-wrap gap-1">
                    <Link
                        v-for="(link, key) in products.links"
                        :href="link.url"
                        :key="key"
                        :class="[
                            'rounded-full px-3 py-0.5 bg-gray-200', {
                                'bg-blue-200': link.active
                            }
                        ]"
                        v-text="link.label"
                    />
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import { Link } from '@inertiajs/vue3';

defineProps({
    products: {
        type: Object,
        default: () => ({
            total: 0,
            per_page: 0,
            last_page: 0,
            current_page: 0,
            from: null,
            to: null,
            path: null,
            prev_page_url: null,
            first_page_url: null,
            links: [],
            last_page_url: null,
            next_page_url: null,
        }),
        required: true
    }
})
</script>
