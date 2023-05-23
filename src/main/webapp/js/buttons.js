`use strict`;

//Arrow IIFE
(() => {
	const adCardsParent = document.querySelector('.ad-cards');

	// Event listener for the edit button
	adCardsParent.addEventListener('click', (event) => {
		if (event.target.id === 'edit-btn') {
			editButtonFunction();
		}
	});
	adCardsParent.addEventListener('click', (event) => {
		if (event.target.id === 'done-btn') {
			doneButton();
		}
	});
	adCardsParent.addEventListener('click', (event) => {
		if (event.target.id === 'delete-btn') {
			deleteButton();
		}
	});

	const toggleVisibility = (element) => {
		element.classList.toggle('invisible');
	};

	// button functions
	const editButtonFunction = () => {
		const editAdsGroup = event.target.previousElementSibling.children[0];
		const editCategories = event.target.previousElementSibling.children[1];
		const currentTitle = event.target.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling;
		const currentCategories = event.target.previousElementSibling.previousElementSibling.previousElementSibling;
		const currentDescription = event.target.previousElementSibling.previousElementSibling;
		const deleteDoneRow = event.target.parentElement.nextElementSibling;
		const editButton = event.target;

		toggleVisibility(editAdsGroup);
		toggleVisibility(editCategories);
		toggleVisibility(currentTitle);
		toggleVisibility(currentCategories);
		toggleVisibility(currentDescription);
		toggleVisibility(deleteDoneRow);
		toggleVisibility(editButton);
	}

	const doneButton = () => {
		const editAdsGroup = event.target.parentElement.previousElementSibling.children[3].children[0];
		const editCategories = event.target.parentElement.previousElementSibling.children[3].children[1];
		const editTitle = event.target.parentElement.previousElementSibling.children[3].children[0].children[1];
		const editDescription = event.target.parentElement.previousElementSibling.children[3].children[0].children[3];
		const currentTitle = event.target.parentElement.previousElementSibling.children[0];
		const currentCategories = event.target.parentElement.previousElementSibling.children[1];
		const currentDescription = event.target.parentElement.previousElementSibling.children[2];
		const deleteDoneRow = event.target.parentElement;
		const editButton = event.target.parentElement.previousElementSibling.children[4];
		const updateForm = event.target.parentElement.previousElementSibling.children[3];

		toggleVisibility(editAdsGroup);
		toggleVisibility(editCategories);
		toggleVisibility(currentTitle);
		toggleVisibility(currentCategories);
		toggleVisibility(currentDescription);
		toggleVisibility(deleteDoneRow);
		toggleVisibility(editButton);

		if (editTitle.value === '') {
			editTitle.value = currentTitle.textContent;
		}

		if (editDescription.value === '') {
			editDescription.value = currentDescription.textContent;
		}

		updateForm.submit();

	}

	const deleteButton = () => {
		const deleteForm = event.target.parentElement.nextElementSibling;
		deleteForm.submit();
	}

})();