<template>
    <UiPopover v-model:open="isOpen">
        <UiPopoverTrigger as-child>
            <slot />
        </UiPopoverTrigger>
        <UiPopoverContent class="w-72">
            <div class="space-y-4">
                <div>
                    <h4 class="font-semibold leading-none">
                        Aktion bestätigen
                    </h4>
                    <p class="text-sm text-muted-foreground mt-2">
                        Sind Sie sicher, dass Sie fortfahren möchten?
                    </p>
                </div>

                <slot name="content" />

                <div class="flex gap-2 pt-2">
                    <UiButton
                        variant="outline"
                        @click="handleCancel"
                    >
                        Abbrechen
                    </UiButton>
                    <UiButton @click="handleConfirm">
                        Bestätigen
                    </UiButton>
                </div>
            </div>
        </UiPopoverContent>
    </UiPopover>
</template>

<script setup lang="ts">
import { ref } from "vue"

const isOpen = ref(false)

const emit = defineEmits<{
    confirm: []
    cancel: []
}>()

const handleConfirm = async () => {
    emit("confirm")
    isOpen.value = false
}

const handleCancel = async () => {
    emit("cancel")
    isOpen.value = false
}
</script>
