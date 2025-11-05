<template>
    <div>
        <NuxtRouteAnnouncer />
        <NuxtLoadingIndicator
            color="var(--color-primary)"
        />

        <ToasterRoot />

        <NuxtLayout>
            <NuxtPage />
        </NuxtLayout>
    </div>
</template>
