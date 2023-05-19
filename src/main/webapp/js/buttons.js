`use strict`;

//Arrow IIFE
(() => {
	const adCardsParent = document.querySelector('.ad-cards');
	const deleteForm = document.querySelector('.delete-form');
	const updateForm = document.querySelector('.update-form');

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

	// button functions
	const editButtonFunction = () => {
		const editTitleLabel = event.target.previousElementSibling.children[0];
		const editTitle = event.target.previousElementSibling.children[1];
		const editDescriptionLabel = event.target.previousElementSibling.children[2];
		const editDescription = event.target.previousElementSibling.children[3];
		const currentTitle = event.target.previousElementSibling.previousElementSibling.previousElementSibling;
		const currentDescription = event.target.previousElementSibling.previousElementSibling;
		const deleteDoneRow = event.target.parentElement.nextElementSibling;
		const editButton = event.target;

		editTitleLabel.classList.toggle('invisible');
		editTitle.classList.toggle('invisible');
		editDescriptionLabel.classList.toggle('invisible');
		editDescription.classList.toggle('invisible');
		currentTitle.classList.toggle('invisible');
		currentDescription.classList.toggle('invisible');
		deleteDoneRow.classList.toggle('invisible');
		editButton.classList.toggle('invisible');
	}

	const doneButton = () => {
		const editTitleLabel = event.target.parentElement.previousElementSibling.children[2].children[0];
		const editTitle = event.target.parentElement.previousElementSibling.children[2].children[1];
		const editDescriptionLabel = event.target.parentElement.previousElementSibling.children[2].children[2];
		const editDescription = event.target.parentElement.previousElementSibling.children[2].children[3];
		const currentTitle = event.target.parentElement.previousElementSibling.children[0];
		const currentDescription = event.target.parentElement.previousElementSibling.children[1];
		const deleteDoneRow = event.target.parentElement;
		const editButton = event.target.parentElement.previousElementSibling.children[3];

		editTitleLabel.classList.toggle('invisible');
		editTitle.classList.toggle('invisible');
		editDescriptionLabel.classList.toggle('invisible');
		editDescription.classList.toggle('invisible');
		currentTitle.classList.toggle('invisible');
		currentDescription.classList.toggle('invisible');
		deleteDoneRow.classList.toggle('invisible');
		editButton.classList.toggle('invisible');

		if (editTitle.value === '') {
			editTitle.value = currentTitle.textContent;
		}
		if (editDescription.value === '') {
			editDescription.value = currentDescription.textContent;
		}
		updateForm.submit();

	}

	const deleteButton = () => {
		deleteForm.submit();
	}

})();